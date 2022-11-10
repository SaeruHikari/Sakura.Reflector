add_rules("mode.debug", "mode.release")

set_languages("c11", "cxx20")

if (is_os("windows")) then 

else

add_requires("brew::llvm", {alias = "llvm"})

target("SkrReflector")
    set_kind("binary")
    add_files("**.cpp")
    add_packages("llvm")
end