// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:custom_app/main.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Navigation Tests', () {
    NavigatorObserver mockNavOb;

    setUp(() {
      mockNavOb = MockNavigatorObserver();
    });

    testWidgets('Test navigation to base selection', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
    });

    testWidgets('Test navigation to ingredient selection', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);
    });

    testWidgets('Test that all the ingredients showed up in checkout', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      await tester.tap(find.byKey(Key('Increment 0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 1')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 2')));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Almond Milk'), findsOneWidget);
      expect(find.text('Spinach x1'), findsOneWidget);
      expect(find.text('Kale x1'), findsOneWidget);
      expect(find.text('Beets x1'), findsOneWidget);
    });
  });


//------------------------------------------------------------------------------
//-----------------------------BASE SELECTION TESTS-----------------------------
//------------------------------------------------------------------------------
  group('Base Selection Tests', () {
    NavigatorObserver mockNavOb;

    setUp(() {
      mockNavOb = MockNavigatorObserver();
    });

    testWidgets('Test that selecting a base actually selects it', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('Test that multiple bases can\'t be selected', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.text('Soy Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('Test that you must select a base', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
    });

  });


//------------------------------------------------------------------------------
//---------------------Ingredient Selection Tests-------------------------------
//------------------------------------------------------------------------------
  group('Ingredient Selection Tests', () {
    NavigatorObserver mockNavOb;

    setUp(() {
      mockNavOb = MockNavigatorObserver();
    });

    testWidgets('Test that all counters start at 0', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      //Test Here

    });

    testWidgets('Test that items have the correct nutritional information', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      //Test Here

    });

    testWidgets('Test that the increment/decrement buttons work', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      //Test Here

    });

    testWidgets('Test that the counters can\'t go below 0', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);


      //Test Here


    });

//UNFINISHED TESTS ABOVE--------------------------------------------------------

    testWidgets('Test that you can\'t select less than 3 ingredients', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      await tester.tap(find.byKey(Key('Increment 0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Protein Shake Fruits'), findsOneWidget);
    });

    testWidgets('Test that you can\'t select more than 3 ingredients', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/second': (context) => SelectBase(),
          '/third': (context) => SelectFruit(),
          '/fourth': (context) => Checkout()
        },
        navigatorObservers: [mockNavOb],
      ));

      await tester.tap(find.text('New Item'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      await tester.tap(find.byKey(Key('Increment 0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 1')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 2')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 3')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Protein Shake Fruits'), findsOneWidget);

      //expect(find.text('Must Select 3 Items'), findsOneWidget);
    });

  });

//  group('Cart Tests', ()
//  {
//    NavigatorObserver mockNavOb;
//
//    setUp(() {
//      mockNavOb = MockNavigatorObserver();
//    });
//
//    testWidgets('Test shake naming and navigation to cart', (WidgetTester tester) async {
//      await tester.pumpWidget(MaterialApp(
//        initialRoute: '/',
//        routes: {
//          '/': (context) => MyApp(),
//          '/second': (context) => SelectBase(),
//          '/third': (context) => SelectFruit(),
//          '/fourth': (context) => Checkout()
//        },
//        navigatorObservers: [mockNavOb],
//      ));
//
//      await tester.tap(find.text('New Item'));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
//
//      await tester.tap(find.text('Almond Milk'));
//      await tester.pumpAndSettle();
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
//      expect(find.byIcon(Icons.check_circle), findsOneWidget);
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Protein Shake Fruits'), findsOneWidget);
//
//      await tester.tap(find.byKey(Key('Increment 0')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 1')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 2')));
//      await tester.pumpAndSettle();
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Almond Milk'), findsOneWidget);
//      expect(find.text('Spinach x1'), findsOneWidget);
//      expect(find.text('Kale x1'), findsOneWidget);
//      expect(find.text('Beets x1'), findsOneWidget);
//
//      //Test Here
//
//    });
//
//    testWidgets('Test that checkout adds the shake to the cart with the correct nutritional information', (WidgetTester tester) async {
//      await tester.pumpWidget(MaterialApp(
//        initialRoute: '/',
//        routes: {
//          '/': (context) => MyApp(),
//          '/second': (context) => SelectBase(),
//          '/third': (context) => SelectFruit(),
//          '/fourth': (context) => Checkout()
//        },
//        navigatorObservers: [mockNavOb],
//      ));
//
//      await tester.tap(find.text('New Item'));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
//
//      await tester.tap(find.text('Almond Milk'));
//      await tester.pumpAndSettle();
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
//      expect(find.byIcon(Icons.check_circle), findsOneWidget);
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Protein Shake Fruits'), findsOneWidget);
//
//      await tester.tap(find.byKey(Key('Increment 0')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 1')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 2')));
//      await tester.pumpAndSettle();
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Almond Milk'), findsOneWidget);
//      expect(find.text('Spinach x1'), findsOneWidget);
//      expect(find.text('Kale x1'), findsOneWidget);
//      expect(find.text('Beets x1'), findsOneWidget);
//
//      //Test Here
//
//    });
//
//    testWidgets('Test that the delete a smoothie button works', (WidgetTester tester) async {
//      await tester.pumpWidget(MaterialApp(
//        initialRoute: '/',
//        routes: {
//          '/': (context) => MyApp(),
//          '/second': (context) => SelectBase(),
//          '/third': (context) => SelectFruit(),
//          '/fourth': (context) => Checkout()
//        },
//        navigatorObservers: [mockNavOb],
//      ));
//
//      await tester.tap(find.text('New Item'));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
//
//      await tester.tap(find.text('Almond Milk'));
//      await tester.pumpAndSettle();
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
//      expect(find.byIcon(Icons.check_circle), findsOneWidget);
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Protein Shake Fruits'), findsOneWidget);
//
//      await tester.tap(find.byKey(Key('Increment 0')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 1')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 2')));
//      await tester.pumpAndSettle();
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Almond Milk'), findsOneWidget);
//      expect(find.text('Spinach x1'), findsOneWidget);
//      expect(find.text('Kale x1'), findsOneWidget);
//      expect(find.text('Beets x1'), findsOneWidget);
//
//      //Test Here
//
//    });
//
//    testWidgets('Test that not naming your smoothie uses the first ingredient as the name', (WidgetTester tester) async {
//      await tester.pumpWidget(MaterialApp(
//        initialRoute: '/',
//        routes: {
//          '/': (context) => MyApp(),
//          '/second': (context) => SelectBase(),
//          '/third': (context) => SelectFruit(),
//          '/fourth': (context) => Checkout()
//        },
//        navigatorObservers: [mockNavOb],
//      ));
//
//      await tester.tap(find.text('New Item'));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(8));
//
//      await tester.tap(find.text('Almond Milk'));
//      await tester.pumpAndSettle();
//
//      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
//      expect(find.byIcon(Icons.check_circle), findsOneWidget);
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Protein Shake Fruits'), findsOneWidget);
//
//      await tester.tap(find.byKey(Key('Increment 0')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 1')));
//      await tester.pumpAndSettle();
//      await tester.tap(find.byKey(Key('Increment 2')));
//      await tester.pumpAndSettle();
//
//      await tester.tap(find.byIcon(Icons.check));
//      await tester.pumpAndSettle();
//
//      verify(mockNavOb.didPush(any, any));
//
//      expect(find.text('Almond Milk'), findsOneWidget);
//      expect(find.text('Spinach x1'), findsOneWidget);
//      expect(find.text('Kale x1'), findsOneWidget);
//      expect(find.text('Beets x1'), findsOneWidget);
//
//      //Test Here
//
//    });
//
//  });
}