// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 ScreenState get screen; DialogState get dialog;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.screen, screen) || other.screen == screen)&&(identical(other.dialog, dialog) || other.dialog == dialog));
}


@override
int get hashCode => Object.hash(runtimeType,screen,dialog);

@override
String toString() {
  return 'HomeState(screen: $screen, dialog: $dialog)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 ScreenState screen, DialogState dialog
});


$ScreenStateCopyWith<$Res> get screen;$DialogStateCopyWith<$Res> get dialog;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? screen = null,Object? dialog = null,}) {
  return _then(_self.copyWith(
screen: null == screen ? _self.screen : screen // ignore: cast_nullable_to_non_nullable
as ScreenState,dialog: null == dialog ? _self.dialog : dialog // ignore: cast_nullable_to_non_nullable
as DialogState,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScreenStateCopyWith<$Res> get screen {
  
  return $ScreenStateCopyWith<$Res>(_self.screen, (value) {
    return _then(_self.copyWith(screen: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DialogStateCopyWith<$Res> get dialog {
  
  return $DialogStateCopyWith<$Res>(_self.dialog, (value) {
    return _then(_self.copyWith(dialog: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScreenState screen,  DialogState dialog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.screen,_that.dialog);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScreenState screen,  DialogState dialog)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.screen,_that.dialog);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScreenState screen,  DialogState dialog)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.screen,_that.dialog);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.screen = const ScreenState.initial(), this.dialog = const DialogState.idle()});
  

@override@JsonKey() final  ScreenState screen;
@override@JsonKey() final  DialogState dialog;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.screen, screen) || other.screen == screen)&&(identical(other.dialog, dialog) || other.dialog == dialog));
}


@override
int get hashCode => Object.hash(runtimeType,screen,dialog);

@override
String toString() {
  return 'HomeState(screen: $screen, dialog: $dialog)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 ScreenState screen, DialogState dialog
});


@override $ScreenStateCopyWith<$Res> get screen;@override $DialogStateCopyWith<$Res> get dialog;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? screen = null,Object? dialog = null,}) {
  return _then(_HomeState(
screen: null == screen ? _self.screen : screen // ignore: cast_nullable_to_non_nullable
as ScreenState,dialog: null == dialog ? _self.dialog : dialog // ignore: cast_nullable_to_non_nullable
as DialogState,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScreenStateCopyWith<$Res> get screen {
  
  return $ScreenStateCopyWith<$Res>(_self.screen, (value) {
    return _then(_self.copyWith(screen: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DialogStateCopyWith<$Res> get dialog {
  
  return $DialogStateCopyWith<$Res>(_self.dialog, (value) {
    return _then(_self.copyWith(dialog: value));
  });
}
}

/// @nodoc
mixin _$ScreenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScreenState()';
}


}

/// @nodoc
class $ScreenStateCopyWith<$Res>  {
$ScreenStateCopyWith(ScreenState _, $Res Function(ScreenState) __);
}


/// Adds pattern-matching-related methods to [ScreenState].
extension ScreenStatePatterns on ScreenState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScreenInitial value)?  initial,TResult Function( ScreenLoading value)?  loading,TResult Function( ScreenSuccess value)?  success,TResult Function( ScreenError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScreenInitial() when initial != null:
return initial(_that);case ScreenLoading() when loading != null:
return loading(_that);case ScreenSuccess() when success != null:
return success(_that);case ScreenError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScreenInitial value)  initial,required TResult Function( ScreenLoading value)  loading,required TResult Function( ScreenSuccess value)  success,required TResult Function( ScreenError value)  error,}){
final _that = this;
switch (_that) {
case ScreenInitial():
return initial(_that);case ScreenLoading():
return loading(_that);case ScreenSuccess():
return success(_that);case ScreenError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScreenInitial value)?  initial,TResult? Function( ScreenLoading value)?  loading,TResult? Function( ScreenSuccess value)?  success,TResult? Function( ScreenError value)?  error,}){
final _that = this;
switch (_that) {
case ScreenInitial() when initial != null:
return initial(_that);case ScreenLoading() when loading != null:
return loading(_that);case ScreenSuccess() when success != null:
return success(_that);case ScreenError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Movie> results)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScreenInitial() when initial != null:
return initial();case ScreenLoading() when loading != null:
return loading();case ScreenSuccess() when success != null:
return success(_that.results);case ScreenError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Movie> results)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ScreenInitial():
return initial();case ScreenLoading():
return loading();case ScreenSuccess():
return success(_that.results);case ScreenError():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Movie> results)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ScreenInitial() when initial != null:
return initial();case ScreenLoading() when loading != null:
return loading();case ScreenSuccess() when success != null:
return success(_that.results);case ScreenError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ScreenInitial implements ScreenState {
  const ScreenInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScreenState.initial()';
}


}




/// @nodoc


class ScreenLoading implements ScreenState {
  const ScreenLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScreenState.loading()';
}


}




/// @nodoc


class ScreenSuccess implements ScreenState {
  const ScreenSuccess({required final  List<Movie> results}): _results = results;
  

 final  List<Movie> _results;
 List<Movie> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenSuccessCopyWith<ScreenSuccess> get copyWith => _$ScreenSuccessCopyWithImpl<ScreenSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenSuccess&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ScreenState.success(results: $results)';
}


}

/// @nodoc
abstract mixin class $ScreenSuccessCopyWith<$Res> implements $ScreenStateCopyWith<$Res> {
  factory $ScreenSuccessCopyWith(ScreenSuccess value, $Res Function(ScreenSuccess) _then) = _$ScreenSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie> results
});




}
/// @nodoc
class _$ScreenSuccessCopyWithImpl<$Res>
    implements $ScreenSuccessCopyWith<$Res> {
  _$ScreenSuccessCopyWithImpl(this._self, this._then);

  final ScreenSuccess _self;
  final $Res Function(ScreenSuccess) _then;

/// Create a copy of ScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(ScreenSuccess(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class ScreenError implements ScreenState {
  const ScreenError({required this.message});
  

 final  String message;

/// Create a copy of ScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenErrorCopyWith<ScreenError> get copyWith => _$ScreenErrorCopyWithImpl<ScreenError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ScreenState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ScreenErrorCopyWith<$Res> implements $ScreenStateCopyWith<$Res> {
  factory $ScreenErrorCopyWith(ScreenError value, $Res Function(ScreenError) _then) = _$ScreenErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ScreenErrorCopyWithImpl<$Res>
    implements $ScreenErrorCopyWith<$Res> {
  _$ScreenErrorCopyWithImpl(this._self, this._then);

  final ScreenError _self;
  final $Res Function(ScreenError) _then;

/// Create a copy of ScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ScreenError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DialogState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogState()';
}


}

/// @nodoc
class $DialogStateCopyWith<$Res>  {
$DialogStateCopyWith(DialogState _, $Res Function(DialogState) __);
}


/// Adds pattern-matching-related methods to [DialogState].
extension DialogStatePatterns on DialogState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DialogIdle value)?  idle,TResult Function( DialogLoading value)?  loading,TResult Function( DialogSuccess value)?  success,TResult Function( DialogError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DialogIdle() when idle != null:
return idle(_that);case DialogLoading() when loading != null:
return loading(_that);case DialogSuccess() when success != null:
return success(_that);case DialogError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DialogIdle value)  idle,required TResult Function( DialogLoading value)  loading,required TResult Function( DialogSuccess value)  success,required TResult Function( DialogError value)  error,}){
final _that = this;
switch (_that) {
case DialogIdle():
return idle(_that);case DialogLoading():
return loading(_that);case DialogSuccess():
return success(_that);case DialogError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DialogIdle value)?  idle,TResult? Function( DialogLoading value)?  loading,TResult? Function( DialogSuccess value)?  success,TResult? Function( DialogError value)?  error,}){
final _that = this;
switch (_that) {
case DialogIdle() when idle != null:
return idle(_that);case DialogLoading() when loading != null:
return loading(_that);case DialogSuccess() when success != null:
return success(_that);case DialogError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( String message)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DialogIdle() when idle != null:
return idle();case DialogLoading() when loading != null:
return loading();case DialogSuccess() when success != null:
return success(_that.message);case DialogError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( String message)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DialogIdle():
return idle();case DialogLoading():
return loading();case DialogSuccess():
return success(_that.message);case DialogError():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( String message)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DialogIdle() when idle != null:
return idle();case DialogLoading() when loading != null:
return loading();case DialogSuccess() when success != null:
return success(_that.message);case DialogError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DialogIdle implements DialogState {
  const DialogIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogState.idle()';
}


}




/// @nodoc


class DialogLoading implements DialogState {
  const DialogLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogState.loading()';
}


}




/// @nodoc


class DialogSuccess implements DialogState {
  const DialogSuccess(this.message);
  

 final  String message;

/// Create a copy of DialogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialogSuccessCopyWith<DialogSuccess> get copyWith => _$DialogSuccessCopyWithImpl<DialogSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DialogState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $DialogSuccessCopyWith<$Res> implements $DialogStateCopyWith<$Res> {
  factory $DialogSuccessCopyWith(DialogSuccess value, $Res Function(DialogSuccess) _then) = _$DialogSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DialogSuccessCopyWithImpl<$Res>
    implements $DialogSuccessCopyWith<$Res> {
  _$DialogSuccessCopyWithImpl(this._self, this._then);

  final DialogSuccess _self;
  final $Res Function(DialogSuccess) _then;

/// Create a copy of DialogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DialogSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DialogError implements DialogState {
  const DialogError(this.message);
  

 final  String message;

/// Create a copy of DialogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialogErrorCopyWith<DialogError> get copyWith => _$DialogErrorCopyWithImpl<DialogError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DialogState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DialogErrorCopyWith<$Res> implements $DialogStateCopyWith<$Res> {
  factory $DialogErrorCopyWith(DialogError value, $Res Function(DialogError) _then) = _$DialogErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DialogErrorCopyWithImpl<$Res>
    implements $DialogErrorCopyWith<$Res> {
  _$DialogErrorCopyWithImpl(this._self, this._then);

  final DialogError _self;
  final $Res Function(DialogError) _then;

/// Create a copy of DialogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DialogError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
