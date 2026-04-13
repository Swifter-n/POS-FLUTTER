part of 'member_bloc.dart';

@freezed
class MemberState with _$MemberState {
  const factory MemberState.initial() = _Initial;
  const factory MemberState.loading() = _Loading;

  // State untuk daftar member (halaman manajemen)
  const factory MemberState.loaded(List<MemberModel> members) = _Loaded;

  // State khusus saat satu member ditemukan (berguna untuk modal kasir)
  const factory MemberState.memberFound(MemberModel member) = _MemberFound;

  const factory MemberState.success(String message) = _Success;
  const factory MemberState.error(String message) = _Error;
}
