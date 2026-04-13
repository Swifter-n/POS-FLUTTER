part of 'member_bloc.dart';

@freezed
class MemberEvent with _$MemberEvent {
  const factory MemberEvent.fetchMembers({String? search}) = _FetchMembers;
  const factory MemberEvent.checkMember(String codeOrPhone) = _CheckMember;
  const factory MemberEvent.registerMember(Map<String, dynamic> data) =
      _RegisterMember;

  // --- TAMBAHAN EVENT UPDATE ---
  const factory MemberEvent.updateMember(int id, Map<String, dynamic> data) =
      _UpdateMember;

  const factory MemberEvent.clearSelected() = _ClearSelected;
}
