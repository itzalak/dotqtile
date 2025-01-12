from pathlib import Path
import toml
from dotqtile.version import __version__


def test_version():
    with Path("pyproject.toml").open(encoding="utf8") as toml_file:
        pyproject_toml = toml.load(toml_file)

    pyproject_version = pyproject_toml["project"]["version"]
    package_version = __version__
    assert f"v{pyproject_version}" == package_version
