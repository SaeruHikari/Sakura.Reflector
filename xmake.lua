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
    add_cxflags("-Wno-c++11-narrowing")
    add_syslinks("pthread", "curses")
    add_linkdirs("clang+llvm-15.0.1-x86_64-apple-darwin/lib")
    add_links("clangTooling", "clangAST")
    on_load(function (target, opt)
        local libs = {}
        local p = "clang+llvm-15.0.1-x86_64-apple-darwin/lib/**.a"
        for __, filepath in ipairs(os.files(p)) do
            table.insert(libs, path.basename(filepath))
        end
        target:add("links", libs)
    end)
    add_includedirs("clang+llvm-15.0.1-x86_64-apple-darwin/include")
    
end
