import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onlytrips/newtrip.dart';
import 'package:onlytrips/tripview.dart';
import 'package:http/http.dart' as http; // Use to post to the api server


void main() {
  final String testEmail = "testingemail2@gmail.com";
  final int testPersons = 1;
  final String testState = "Florida";
  final String testCity = "Orlando";
  final String startDate = "2020-12-25T06:00:00.000+00:00";
  final String endDate = "2021-01-30T06:00:00.000+00:00";
  final String userId = "5fb992bcd03dcc0093ccaf93";

  group('Trip Functions', () {
    testWidgets('Should fail to create a new trip object given wrong userId',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            PostNewTrip trip = await submitTrip(
                testEmail,
                testPersons,
                testState,
                testCity,
                startDate,
                endDate,
                "abc");
            expect(trip.success, false);
          });
        });

    testWidgets('Should fail to create a new trip object given wrong email',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            PostNewTrip trip = await submitTrip(
                "fishsticks@gmail.com",
                testPersons,
                testState,
                testCity,
                startDate,
                endDate,
                userId);
            expect(trip.success, false);
          });
        });

    testWidgets('Should create a new trip object',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            PostNewTrip trip = await submitTrip(
                testEmail,
                testPersons,
                testState,
                testCity,
                startDate,
                endDate,
                userId);
            expect(trip.success, true);
          });
        });
  });
}

