@for /d %%d in (%HOMEDRIVE%%HOMEPATH%\vimfiles\bundle\*) do @(
        if exist %%d\.git (
            cd %%d
            git remote -v
            git pull
            )
        )
