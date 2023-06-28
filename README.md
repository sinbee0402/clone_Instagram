# instagram_clone

A new Flutter project.

## Error
### 1st Error
- The Android Gradle plugin supports only Kotlin Gradle plugin version 1.5.20 and higher.
  The following dependencies do not satisfy the required version:
  project ':sign_in_with_apple' -> org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.50
- solution : External Libraries /Flutter Plugins 에 google_sign_in_apple-3.3.0 파일에서 그래들이 1.3.50으로 설정돼 있어서 1.7.10으로 변경
-> 곧바로 2nd Error 발생
  
### 2nd Error
- Suggestion: use a compatible library with a minSdk of at most 16,
  or increase this project's minSdk version to at least 19,
  or use tools:overrideLibrary="io.flutter.plugins.firebase.database" to force usage (may lead to runtime failures)
- solution : instagram_clone\android\app\build.gradle 파일의 minSdkVersion 19 변경
-> 곧바로 3rd Error 발생

### 3rd Error
- Note: C:\Users\user\AppData\Local\Pub\Cache\hosted\pub.dev\cloud_firestore-4.8.1\android\src\main\java\io\flutter\plugins\firebase\firestore\FlutterFirebaseFirestoreMessageCodec.java uses unchecked or unsafe operations.
  Note: Recompile with -Xlint:unchecked for details.
  ERROR:D8: Cannot fit requested classes in a single dex file (# methods: 131508 > 65536)
  com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
  The number of method references in a .dex file cannot exceed 64K.
  Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html <br>
  Caused by: com.android.tools.r8.CompilationFailedException: Compilation failed to complete, position: null <br>
  Caused by: com.android.tools.r8.internal.f: Cannot fit requested classes in a single dex file (# methods: 131508 > 65536) <br>
  FAILURE: Build failed with an exception. <br>
  * What went wrong:
    Execution failed for task ':app:mergeExtDexDebug'.
  > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingTaskDelegate
  > There was a failure while executing work items
  > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingWorkAction     
  > com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
  The number of method references in a .dex file cannot exceed 64K.  
  Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
  * Try:
  > Run with --stacktrace option to get the stack trace.
  > Run with --info or --debug option to get more log output.
  > Run with --scan to get full insights.
  * Get more help at https://help.gradle.org <br>
  BUILD FAILED in 2m 2s
  [!] App requires Multidex support
  Multidex support is required for your android app to build since the number of methods has exceeded 64k. See https://docs.flutter.dev/deployment/android#enabling-multidex-support for more information. You may pass the --no-multidex flag to skip Flutter's multidex support to use a manual solution.
  Flutter tool can add multidex support. The following file will be added by flutter:
  android/app/src/main/java/io/flutter/app/FlutterMultiDexApplication.java
  cannot prompt without a terminal ui
  Exception: Gradle task assembleDebug failed with exit code 1
- solution : instagram_clone\android\app\build.gradle 파일에 minSdkVersion 21 변경

### 4th Error
- firebase login 입력시 발생
- firebase : 이 시스템에서 스크립트를 실행할 수 없으므로 C:\Program Files\nodejs\firebase.ps1 파일을 로드할 수 없습니다. 자세한 내용은 about_Execution_Policies(https://go.microsoft.com/fw
  link/?LinkID=135170)를 참조하십시오.
  위치 줄:1 문자:1
  + firebase login
  + ~~~~~~~~
    + CategoryInfo          : 보안 오류: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
- solution : https://hellcoding.tistory.com/entry/VSCode-%EC%98%A4%EB%A5%98-%EC%9D%B4-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%97%90%EC%84%9C-%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%A5%BC-%EC%8B%A4%ED%96%89%ED%95%A0-%EC%88%98-%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C

### 5th Error
- AndroidStudio Terminal, git bash, powershell에 입력시 발생
- flutterfire 입력시 발생
- flutterfire configure 입력시 발생
- flutterfire configure --project=instagram-clone-key 입력시 발생
- flutterfire : 'flutterfire' 용어가 cmdlet, 함수, 스크립트 파일 또는 실행할 수 있는 프로그램 이름으로 인식되지 않습니다. 이름이 정확한지 확인하고 경로가 포함된 경우 경로가 올바른지 검증
  한 다음 다시 시도하십시오.
  위치 줄:1 문자:1
  + flutterfire configure --project=instagram-clone-key
  + ~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (flutterfire:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
- solution : 해당 프로젝트 폴더에서 직접 cmd를 열어서 입력하면 잘 진행된다.

### 참고자료
- https://www.inflearn.com/questions/846331/the-android-gradle-plugin-supports-only-kotlin-gradle-plugin-version-1-5-20-and
