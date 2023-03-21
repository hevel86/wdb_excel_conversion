## WDB to Excel Conversion

This Python program converts Microsoft Works Database (WDB) files to Excel (XLSX) format. 
The program utilizes the WorksDatabaseConverter.jar Java library for extracting header fields and LibreOffice for the actual conversion.
It can be run both in a standalone environment or within a Docker container.

## Standalone Requirements

* Requirements
* Python 3.6 or later
* Java Runtime Environment (JRE) for running WorksDatabaseConverter.jar found at https://minio.mbd-inc.io/wdb-excel-conversion/WorksDatabaseConverter.jar
* LibreOffice for the conversion process
* openpyxl (Python package) for manipulating Excel files

### Installation

1. Clone the repository:

```bash
git clone https://gitea.mbd-inc.io/michael.dages/wdb_excel_conversion.git
```

2. Install the required Python package:

```bash
pip install openpyxl 
```

3. Download and install Java Runtime Environment (JRE) if not already installed.
4. Download and install LibreOffice.
5. Place the WorksDatabaseConverter.jar file in the source directory.

### Usage

1. Adjust the following variables in the script according to your system and requirements:

   - source_dir: The directory where the WDB files are located.
   * converter_path: The path to the WorksDatabaseConverter.jar file.
   * libreoffice_path: The path to the LibreOffice executable.

2. Run the script:

```bash
 python wdb_to_xlsx.py
```

Replace `path/to/source`, `/path/to/WorksDatabaseConverter.jar`, and `/path/to/soffice` with the appropriate paths on your system.

## Docker Compose (Preferred Method)

```docker
  wdb_excel_conversion:
    container_name: wdb_excel_conversion
    image: gitea.mbd-inc.io/michael.dages/wdb_excel_conversion:latest
    environment:
      - CONVERTER_PATH=/path/to/WorksDatabaseConverter.jar #optional
      - LIBREOFFICE_PATH=/path/to/soffice #optional
    volumes:
      - /path/to/source:/app/source
```
Replace `path/to/source`, `/path/to/WorksDatabaseConverter.jar`, and `/path/to/soffice` with the appropriate paths on your system.

## License

This project is licensed under the MIT License. See the [LICENSE](https://gitea.mbd-inc.io/michael.dages/wdb_excel_conversion/src/branch/master/LICENSE.md) file for details.

