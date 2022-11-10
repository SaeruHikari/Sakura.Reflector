add_rules("mode.debug", "mode.release")

set_languages("c11", "cxx20")

if (is_os("windows")) then 

else

add_requires("brew::llvm", {alias = "llvm"})
add_requires("brew::zstd", {alias = "zstd"})

target("SkrReflector")
    set_kind("binary")
    add_files("**.cpp")
    add_packages("llvm")
    add_packages("zstd")
    add_syslinks("pthread")
end