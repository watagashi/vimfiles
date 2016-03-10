@rem vim:ts=4 sw=4 et
@for /d %%d in ("%~dp0bundle\*") do @(

    rem Git

    if exist %%d\.git (
        pushd %%d
        git remote -v
        git pull
        popd
    )

    rem Mercurial

    if exist %%d\.hg (
        pushd %%d
        hg path default
        hg pull -u
        popd
    )
)
