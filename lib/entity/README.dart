//在build.yaml加入
/*
targets:
  $default:
    builders:
      dart_json_mapper:
          generate_for:
            - lib/main.dart

      # This part is needed to tell original reflectable builder to stay away
      # it overrides default options for reflectable builder to an **empty** set of files
      reflectable:
        generate_for:
          - no/files
*/
//修改model类之后，运行下面的命令
// flutter pub run build_runner build --delete-conflicting-outputs

//在 main 方法执行 initializeJsonMapper();初始化
