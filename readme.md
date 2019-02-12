# GTC 2019 Talk 

Repository for my GTC 2019 Talk slides, title "Large-Scale Road Network Simulations for Smart Cities", S9387


## Building the slides

The slides are build using the `backslide` npm package, to create `remark.js` based slides.


1. Install `npm`

```
    sudo apt install npm
```

2. Install backslide

```
    sudo npm install -g backslide
```

3. Use backslide to serve the files, this will open a browser window with live refresh etc

```
    bs serve
```

## Presenting

When the backslide presentation is open, press `P` for presenter mode or `C` for a new window containing the presenter mode


## Exporting slides

To export a HTML version of the slides in the `dist` directory:

```
    bs e presentation.md
```

To export a PDF version of the slides in the `dist` directory:

```
    bs p presentation.md
```

Unfortunately this does not seem to correctly deal with videos. Instead it may be better to open the HTML version in chrome, and save as PDF.
