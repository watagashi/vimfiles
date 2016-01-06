@for /d %%d in ("%~dp0bundle\*") do @(
        if exist %%d\.git (
            pushd %%d
            git remote -v
            git pull
	    popd
            )
        )
