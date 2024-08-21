// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/GetCompanies/getcompanies_cubit.dart';
import 'package:jobsque_flutter/View/Screens/Notifications.dart';
import 'package:jobsque_flutter/View/Widgets/GreetingWidget.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/RecentJobCard.dart';
import 'package:jobsque_flutter/View/Widgets/SuggestedJobCard.dart';
import 'package:searchfield/searchfield.dart';

class Homescreencontent extends StatelessWidget {
  const Homescreencontent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreetingWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifications(),
                          ));
                    },
                    icon: Image.asset("images/notification.png")),
              ],
            ),
            SizedBox(height: 10),
            Mytext(
              textAlign: TextAlign.start,
              text: 'Create a better future for yourself here',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 15),
            Expanded(
              child: BlocBuilder<GetcompaniesCubit, GetcompaniesState>(
                builder: (context, state) {
                  if (state is GetcompaniesLoadingState) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Color(0xFF3366FF),
                    ));
                  } else if (state is GetcompaniesSuccessState) {
                    final companies = GetcompaniesCubit.get(context).comp;
                    final suggestions = companies?.data?.map((company) {
                          return SearchFieldListItem(company.name!);
                        }).toList() ??
                        [];

                    return Column(
                      children: [
                        SearchField(
                          searchInputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Image.asset("images/search-normal.png"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                            ),
                            hintText: 'Search...',
                          ),
                          suggestions: suggestions,
                          hint: 'Search...',
                          searchStyle: TextStyle(fontSize: 15),
                          maxSuggestionsInViewPort: 5,
                          itemHeight: 50,
                          onTap: () {
                            print("Done");
                          },
                        ),
                        SizedBox(height: 15),
                        SuggestedJobCard(),
                        SizedBox(height: 15),
                        Expanded(
                          child: ListView.builder(
                            itemCount: companies?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final company = companies!.data![index];
                              return RecentJobCard(
                                name: company.name!,
                                location: company.location!,
                                salary: '\$15K/Month',
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetcompaniesErrorState) {
                    return Center(child: Text('Failed to load companies'));
                  } else {
                    return Center(child: Text('Search for companies'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
