import 'dart:async';

import 'package:logging/logging.dart';

import 'package:puppet_master/src/cdp_session.dart' show CDPSession;
import 'package:puppet_master/src/utils.dart' show Utils;

class ExecutionContext {
  final Logger _log = new Logger('ExecutionContext');
  CDPSession _client;
  Object _frame;
  Object _contextId;
  Object _objectHandleFactory;

  ExecutionContext(this._client, contextPayload, objectHandleFactory, frame) {
    this._frame = frame;
    this._contextId = contextPayload['id'];
    this._objectHandleFactory = objectHandleFactory;
  }

  frame() {
    return this._frame;
  }

  Future evaluate(pageFunction, {List params}) async {
    JSHandle handle = await this.evaluateHandle(pageFunction, params: params);
    var result = await handle.jsonValue().catchError((error) {
      _log.shout(error);
      throw error;
    });
    await handle.dispose();
    return result;
  }

  Future<JSHandle> evaluateHandle(pageFunction, {List params}) async {
    throw new UnimplementedError();
  }

}

class JSHandle {
  final Logger _log = new Logger('JSHandle');
  ExecutionContext _context;
  Object _client;
  Object _remoteObject;
  bool _disposed;
  Utils _utils;

  JSHandle(context, client, remoteObject, this._utils) {
    this._context = context;
    this._client = client;
    this._remoteObject = remoteObject;
    this._disposed = false;
  }

  ExecutionContext executionContext() {
    return this._context;
  }

  Future dispose() async {
    if (this._disposed) return;
    this._disposed = true;
    await this._utils.releaseObject(this._client, this._remoteObject);
  }

  Future jsonValue() async {
    return new UnimplementedError();
  }

}