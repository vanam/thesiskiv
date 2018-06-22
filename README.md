# LaTeX Thesis Template for the University of West Bohemia

It is a LaTeX template (not only) for bachelor (Bsc.), master (Ing.), or doctoral (Ph.D.) theses typesetting at the University of West Bohemia in Pilsen (the Department of Computer Science and Engineering).

The template is inspired by templates:
- [University of West Bohemia](https://courseware.zcu.cz/CoursewarePortlets2/DownloadDokumentu?id=119619)
- [Charles University](https://www.mff.cuni.cz/studium/bcmgr/prace/vzor-dp.zip)
- [University of Bristol](https://www.overleaf.com/latex/templates/university-of-bristol-thesis-template/kzqrfvyxxcdm#.Wm7TPXXwZto)

[Tips & Tricks (czech)](https://www.herout.net/tao-diplomky/)

## Run with Docker

1) Install Docker
2) Build image `docker build -t vanam/texlive-2018 .` using `Dockerfile`
3) Run `./docker-run.sh`
4) (Re)compile by `make clean && make` command

## Notable features

* Docker image
* Supports PDF/A-2u (PDF for Long-term Preservation)
  - Metadata are defined in `thesis.xmpdata` file
  - Check metadata at [get-metadata.com](https://www.get-metadata.com/)
* Compile document with scanned specification file
* Double sided by default
* Draft version with watermark

## Credits

- Petr Lobaz
