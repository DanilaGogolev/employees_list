// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmployeesState {
  IList<Employee> get employees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeesStateCopyWith<EmployeesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeesStateCopyWith<$Res> {
  factory $EmployeesStateCopyWith(
          EmployeesState value, $Res Function(EmployeesState) then) =
      _$EmployeesStateCopyWithImpl<$Res, EmployeesState>;
  @useResult
  $Res call({IList<Employee> employees});
}

/// @nodoc
class _$EmployeesStateCopyWithImpl<$Res, $Val extends EmployeesState>
    implements $EmployeesStateCopyWith<$Res> {
  _$EmployeesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_value.copyWith(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as IList<Employee>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeesStateCopyWith<$Res>
    implements $EmployeesStateCopyWith<$Res> {
  factory _$$_EmployeesStateCopyWith(
          _$_EmployeesState value, $Res Function(_$_EmployeesState) then) =
      __$$_EmployeesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<Employee> employees});
}

/// @nodoc
class __$$_EmployeesStateCopyWithImpl<$Res>
    extends _$EmployeesStateCopyWithImpl<$Res, _$_EmployeesState>
    implements _$$_EmployeesStateCopyWith<$Res> {
  __$$_EmployeesStateCopyWithImpl(
      _$_EmployeesState _value, $Res Function(_$_EmployeesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
  }) {
    return _then(_$_EmployeesState(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as IList<Employee>,
    ));
  }
}

/// @nodoc

class _$_EmployeesState implements _EmployeesState {
  const _$_EmployeesState({this.employees = const IListConst<Employee>([])});

  @override
  @JsonKey()
  final IList<Employee> employees;

  @override
  String toString() {
    return 'EmployeesState(employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeesState &&
            const DeepCollectionEquality().equals(other.employees, employees));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(employees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeesStateCopyWith<_$_EmployeesState> get copyWith =>
      __$$_EmployeesStateCopyWithImpl<_$_EmployeesState>(this, _$identity);
}

abstract class _EmployeesState implements EmployeesState {
  const factory _EmployeesState({final IList<Employee> employees}) =
      _$_EmployeesState;

  @override
  IList<Employee> get employees;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeesStateCopyWith<_$_EmployeesState> get copyWith =>
      throw _privateConstructorUsedError;
}
