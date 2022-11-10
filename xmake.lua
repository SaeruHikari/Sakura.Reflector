add_rules("mode.debug", "mode.release")

set_languages("c11", "cxx17")

if (is_os("windows")) then 
target("meta")
    set_runtimes("MD")
    set_kind("binary")
    add_files("**.cpp")
    add_cxflags("-Wno-c++11-narrowing")
    add_links("lib/**")
    add_links("Version", "advapi32", "Shcore", "user32", "shell32", "Ole32", {public = true})
else
target("meta")
    set_kind("binary")
    add_files("**.cpp")
    add_syslinks("pthread", "curses")
    add_links("clang+llvm-15.0.1-x86_64-apple-darwin/lib/**")
    add_includedirs("clang+llvm-15.0.1-x86_64-apple-darwin/include")
end