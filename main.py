import subprocess
import os
import glob

# ADMIN folder location
source_dir = r"\\mbdfsretro\ADMIN"
output_dir = r"C:\Users\archa\PycharmProjects\wdb_excel_conversion\wdb_converted"

# Path to the LibreOffice executable
libreoffice_path = r'C:\Program Files\LibreOffice\program\soffice.exe'

for root, dirs, files in os.walk(source_dir):
    for file in files:
        if file.endswith(".WDB"):
            # construct the output file name by replacing the file extension with xlsx
            output_file = os.path.splitext(file)[0] + ".xlsx"

            # construct the input file path
            input_file = os.path.join(root, file)

            # construct the output file path
            output_path = os.path.join(output_dir, output_file)

            # Call the LibreOffice CLI to convert the Works file to Excel
            subprocess.call([libreoffice_path, '--headless', '--convert-to', 'xlsx', '--outdir', output_dir, input_file])

            print(f"Converted {input_file} to {output_file} in {output_dir}")
