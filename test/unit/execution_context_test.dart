import 'dart:async';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:puppet_master/src/execution_context.dart' show ExecutionContext, JSHandle;

import 'mocks/mocks.dart';

void main() {
  group('ExecutionContext', () {

    test('can be instantiated via constructor', () {
      ExecutionContext executionContext = new ExecutionContext(null, {'id':'id'}, null, null);
      expect(executionContext, isNotNull);
    });

    // test('can evaluate a function and return an error', () {
    //   // MockJSHandle mockJSHandle = new MockJSHandle();
    //   // MockExecutionContext mockExecutionContext = new MockExecutionContext();
    //   // when(mockExecutionContext.evaluateHandle(typed(any), params: typed(any, named: 'params'))).thenAnswer((_) => mockJSHandle);
    //   // when(mockExecutionContext.evaluate(typed(any), params: typed(any, named:'params'))).thenAnswer((_) async {
    //   //   return await
    //   // });
    //   // when(mockJSHandle.jsonValue).thenAnswer((_) => new Future.value(new Error()));
    //   // expect(spyExecutionContext.evaluate('a function', ['a', 1]), throwsA(''));
    //   ExecutionContext executionContext = new ExecutionContext(null, {'id':'id'}, null, null);
    //   executionContext.evaluateHandle = (_) => null;
    // });

    test('should fail for disposed handles', () {

    }, skip: true);

    test('should fail primitive values as prototypes', () {

    }, skip: true);
  });

  group('JSHandle', () {
    JSHandle jsHandle;
    MockUtils mockUtils;
    MockExecutionContext mockExecutionContext;

    setUpAll(() {
      mockUtils = new MockUtils();
      mockExecutionContext = new MockExecutionContext();
      when(mockUtils.releaseObject).thenAnswer((_) => new Future.value());
      
      jsHandle = new JSHandle(mockExecutionContext, null, null, mockUtils);
    });

    test('can be instantiated via constructor as not disposed', () {
      expect(jsHandle, isNotNull);
    });

    test('can dispose of object reference', () {
      expect(jsHandle.dispose(), completes);
    });

    test('can access the execution context', () {
      expect(jsHandle.executionContext(), equals(mockExecutionContext));
    });

  });
}