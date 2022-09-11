all:
	npx elm-live src/Main.elm --start-page=index.html -- --output=public/dist/main.js

.PHONY: all

