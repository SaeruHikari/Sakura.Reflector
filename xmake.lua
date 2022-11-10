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

add_requires("brew::zstd", {alias = "zstd"})
add_requires("brew::llvm", {alias = "llvm"})

target("meta")
    set_kind("binary")
    add_files("**.cpp")
    add_packages("llvm", "zstd", "ncurses")
    add_syslinks("pthread", "curses")
end