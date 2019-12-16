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
  /*group('Navigation Tests', () {
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

      expect(find.text('Raspberries'), findsOneWidget);
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

      expect(find.text('Raspberries'), findsOneWidget);

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

    testWidgets('Test shake naming and navigation to cart', (WidgetTester tester) async {
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      final Finder shakeNameField = find.widgetWithText(TextField, 'Enter Shake Name');
      await tester.enterText(shakeNameField, "Test Shake");
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Test Shake'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);

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

      expect(find.text('Raspberries'), findsOneWidget);

      final counter0 = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      final counter1 = await tester.widget<Text>(find.byKey(Key('Quantity 1')));
      final counter2 = await tester.widget<Text>(find.byKey(Key('Quantity 2')));

      expect(counter0.data.toString(), "0x");
      expect(counter1.data.toString(), "0x");
      expect(counter2.data.toString(), "0x");
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

      expect(find.text('Raspberries'), findsOneWidget);

      final counter0Init = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Init.data.toString(), "0x");

      await tester.tap(find.byKey(Key("Increment 0")));
      await tester.pumpAndSettle();

      final counter0Inc = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Inc.data.toString(), "1x");

      await tester.tap(find.byKey(Key("Decrement 0")));
      await tester.pumpAndSettle();

      final counter0Dec = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Dec.data.toString(), "0x");
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

      expect(find.text('Raspberries'), findsOneWidget);

      final counter0Init = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Init.data.toString(), "0x");

      await tester.tap(find.byKey(Key("Decrement 0")));
      await tester.pumpAndSettle();

      final counter0Final = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Final.data.toString(), "0x");
    });

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

      expect(find.text('Raspberries'), findsOneWidget);

      await tester.tap(find.byKey(Key('Increment 0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Raspberries'), findsOneWidget);
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      expect(find.text('Raspberries'), findsOneWidget);
    });
  });

//------------------------------------------------------------------------------
//------------------------------Cart Tests--------------------------------------
//------------------------------------------------------------------------------

  group('Cart Tests', () {
    NavigatorObserver mockNavOb;

    setUp(() {
      mockNavOb = MockNavigatorObserver();
    });

    testWidgets('Test that the delete a smoothie button works', (WidgetTester tester) async {
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      final Finder shakeNameField = find.widgetWithText(TextField, 'Enter Shake Name');
      await tester.enterText(shakeNameField, "Test Shake");
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Test Shake'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(find.text('Test Shake'), findsNothing);
      expect(find.text('69.00'), findsNothing);
      expect(find.text('2.21'), findsNothing);
      expect(find.text('3.30'), findsNothing);
      expect(find.text('11.09'), findsNothing);
      expect(find.text('3.38'), findsNothing);
    });

    testWidgets('Test that not naming your smoothie uses the first ingredient as the name', (WidgetTester tester) async {
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Spinach'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);
    });

    testWidgets('Test that the checkout button prompts the user for an email for the order receipt', (WidgetTester tester) async {
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      final Finder shakeNameField = find.widgetWithText(TextField, 'Enter Shake Name');
      await tester.enterText(shakeNameField, "Test Shake");
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Test Shake'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.done_all));
      await tester.pumpAndSettle();

      expect(find.text('Order Receipt'), findsOneWidget);

      final Finder emailField = find.widgetWithText(TextField, 'Enter Email Address');
      await tester.enterText(emailField, 'test@mail.customshakes.com');
      await tester.pumpAndSettle();

      expect(find.text('test@mail.customshakes.com'), findsOneWidget);

      await tester.tap(find.text('Send'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      /*
      expect(find.text('Test Shake', skipOffstage: true), findsNothing);
      expect(find.text('69.00', skipOffstage: true), findsNothing);
      expect(find.text('2.21', skipOffstage: true), findsNothing);
      expect(find.text('3.30', skipOffstage: true), findsNothing);
      expect(find.text('11.09', skipOffstage: true), findsNothing);
      expect(find.text('3.38', skipOffstage: true), findsNothing);
      */
    });

    testWidgets('Test that not inputting your email still works', (WidgetTester tester) async {
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

      expect(find.text('Raspberries'), findsOneWidget);

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

      final Finder shakeNameField = find.widgetWithText(TextField, 'Enter Shake Name');
      await tester.enterText(shakeNameField, "Test Shake");
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Test Shake'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.done_all));
      await tester.pumpAndSettle();

      expect(find.text('Order Receipt'), findsOneWidget);

      final Finder emailField = find.widgetWithText(TextField, 'Enter Email Address');
      await tester.enterText(emailField, 'test@mail.customshakes.com');
      await tester.pumpAndSettle();

      expect(find.text('test@mail.customshakes.com'), findsOneWidget);

      await tester.tap(find.text('Send'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      /*
      expect(find.text('Test Shake', skipOffstage: true), findsNothing);
      expect(find.text('69.00', skipOffstage: true), findsNothing);
      expect(find.text('2.21', skipOffstage: true), findsNothing);
      expect(find.text('3.30', skipOffstage: true), findsNothing);
      expect(find.text('11.09', skipOffstage: true), findsNothing);
      expect(find.text('3.38', skipOffstage: true), findsNothing);
      */
    });
  });*/

  group('Super Test - Test everything at once', ()
  {
    NavigatorObserver mockNavOb;

    setUp(() {
      mockNavOb = MockNavigatorObserver();
    });

    testWidgets('Super Test', (WidgetTester tester) async {
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

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.text('Soy Milk'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.add_circle_outline), findsNWidgets(7));
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.tap(find.text('Almond Milk'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Raspberries'), findsOneWidget);

      final counter0 = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      final counter1 = await tester.widget<Text>(find.byKey(Key('Quantity 1')));
      final counter2 = await tester.widget<Text>(find.byKey(Key('Quantity 2')));

      expect(counter0.data.toString(), "0x");
      expect(counter1.data.toString(), "0x");
      expect(counter2.data.toString(), "0x");

      final counter0Init = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Init.data.toString(), "0x");

      await tester.tap(find.byKey(Key("Decrement 0")));
      await tester.pumpAndSettle();

      final counter0Final = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Final.data.toString(), "0x");

      await tester.tap(find.byKey(Key("Increment 0")));
      await tester.pumpAndSettle();

      final counter0Inc = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Inc.data.toString(), "1x");

      await tester.tap(find.byKey(Key("Decrement 0")));
      await tester.pumpAndSettle();

      final counter0Dec = await tester.widget<Text>(find.byKey(Key('Quantity 0')));
      expect(counter0Dec.data.toString(), "0x");

      await tester.tap(find.byKey(Key('Increment 0')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Raspberries'), findsOneWidget);

      await tester.tap(find.byKey(Key('Increment 1')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 2')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('Increment 3')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Raspberries'), findsOneWidget);

      await tester.tap(find.byKey(Key('Decrement 3')));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPush(any, any));

      expect(find.text('Almond Milk'), findsOneWidget);
      expect(find.text('Spinach x1'), findsOneWidget);
      expect(find.text('Kale x1'), findsOneWidget);
      expect(find.text('Beets x1'), findsOneWidget);

      final Finder shakeNameField = find.widgetWithText(
          TextField, 'Enter Shake Name');
      await tester.enterText(shakeNameField, "Test Shake");
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

      expect(find.text('Test Shake'), findsOneWidget);
      expect(find.text('69.00'), findsOneWidget);
      expect(find.text('2.21'), findsOneWidget);
      expect(find.text('3.30'), findsOneWidget);
      expect(find.text('11.09'), findsOneWidget);
      expect(find.text('3.38'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(find.text('Test Shake'), findsNothing);
      expect(find.text('69.00'), findsNothing);
      expect(find.text('2.21'), findsNothing);
      expect(find.text('3.30'), findsNothing);
      expect(find.text('11.09'), findsNothing);
      expect(find.text('3.38'), findsNothing);

      await tester.tap(find.byIcon(Icons.done_all));
      await tester.pumpAndSettle();

      //actual shake deleted, but can still test if email prompt is given on checkout

      expect(find.text('Order Receipt'), findsOneWidget);

      final Finder emailField = find.widgetWithText(TextField, 'Enter Email Address');
      await tester.enterText(emailField, 'test@mail.customshakes.com');
      await tester.pumpAndSettle();

      expect(find.text('test@mail.customshakes.com'), findsOneWidget);

      await tester.tap(find.text('Send'));
      await tester.pumpAndSettle();

      verify(mockNavOb.didPop(any, any));

    });
  });
}