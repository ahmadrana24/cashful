import 'package:flutter_application_1/configs/firebase_helper.dart';
import 'package:flutter_application_1/models/background_info_model.dart';
import 'package:flutter_application_1/repositories/user_repo.dart';
import 'package:flutter_application_1/view_models/apply_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'apply_view_model_test.mocks.dart';

@GenerateMocks([UserRepository, FirebaseHelper])
void main() {
  test("Dumb test", () {
    expect(2, 1 + 1);
  });

  group('Testing apply view model', () {
    var userRepo = MockUserRepository();
    var firebaseHelper = MockFirebaseHelper();
    when(firebaseHelper.getUserId()).thenReturn("");
    var bgInfoMock = BackgroundInformation.mock();
    when(userRepo.addBackgroundInfo(bgInfoMock, ""))
        .thenAnswer((_) async => true);
    var applyVm = ApplyViewModel(userRepo, firebaseHelper);

    test("False should be returned", () async {
      var bgInfo = BackgroundInformation();
      when(userRepo.addBackgroundInfo(bgInfo, ""))
          .thenAnswer((_) async => false);
      applyVm.backgroundInformation = bgInfo;
      expect(await applyVm.addBackgroundInfo(), false);
    });
    test("True should be returned", () async {
      applyVm.backgroundInformation = bgInfoMock;
      expect(await applyVm.addBackgroundInfo(), true);
    });
  });
}
