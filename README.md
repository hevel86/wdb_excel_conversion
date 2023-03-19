## WDB to Excel Conversion

Converts Microsoft Works 3.1 files to Excel Spreadsheet format xlsx using LibreOffice CLI and Python.
Docker Compose is the recommended use case so you don't clutter your PC with Java and LibreOffice... especially Java.

## Docker Compose

```docker
  wdb_excel_conversion:
    container_name: wdb_excel_conversion
    image: gitea.mbd-inc.io/michael.dages/wdb_excel_conversion/wdb_excel_conversion:latest
    volumes:
      - /path/to/source:/app/source
      - /path/to/output:/app/output
```

### Parameters
* `-v /app/source` - The folder containing the MS Works Database file.  Also checks subdirectories.
* `-v /app/output` - The folder that the Spreadsheets will be exported to