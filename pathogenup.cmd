@rem vim:ts=4 sw=4 et
@for /d %%d in ("%~dp0bundle\*") do @(

    rem Git

    if exist %%d\.git (
        pushd %%d
        git pull --verbose
        popd
    )

    rem Mercurial

    if exist %%d\.hg (
        hg --cwd %%d pull -u
    )
)
