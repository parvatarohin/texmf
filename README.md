# texmf

My personal, `local`, additions to the `texmf` directory tree.

## Setup

Clone the repository and set the `TEXMFHOME` environment variable to the location of the cloned repository.

```bash
git clone https://github.com/parvatarohin/texmf.git
ln -s /path/to/clone/texmf ~/texmf

texhash ~/texmf
```

Once all files are in the right place, rebuild TeX indexes:

```bash
mktexlsr
```

## Updates

These files change in small ways quite often (weekly? monthly?), so do a `git pull` from time to time to get the latest versions.

## License

Public domain. See the file [LICENSE](/LICENSE) for more details. (Quite obviously this only applies to stuff I've written, i.e., things without an explicit attribution.)

Happy TeXing!
