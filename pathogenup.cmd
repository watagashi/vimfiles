@rem vim:ts=4 sw=4 et
@for /d %%d in ("%~dp0bundle\*") do @(

    rem Git

    if exist %%d\.git (
        echo %%~nxd
        pushd %%d
        git pull
        popd
    )

    rem Mercurial

    if exist %%d\.hg (
        echo %%~nxd
        hg --cwd %%d pull -u
    )
)
