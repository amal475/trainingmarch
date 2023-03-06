#!/bin/bash
source parameter_env_uc1.ini
# Check that the source directory exists and is readable
if [ ! -r "$src_dir" ]; then
  echo "Error: source directory not found or not readable"
  exit 1
fi
# Check if the output file already exists
if [ -e "$output_file" ]; then
  read -p "Warning: output file exists. Overwrite? (y/n) " confirm
  if [ "$confirm" != "y" ]; then
    echo "Aborted."
    exit 1
  fi
fi
# Create a temporary file to store the list of ignored files
temp_file=$(mktemp)
# Use Git to get a list of ignored files and write them to the temporary file
git -C "$src_dir" ls-files --ignored --exclude-standard --directory >"$temp_file"
# Create the zip archive, excluding the ignored files list and any other ignored files
if zip -r "$output_file" "$src_dir" -x@"$temp_file"; then
  echo "Archive creation successful" >>$log
else
  echo "Error: archive creation failed" >>$log
  exit 1
fi
# Clean up the temporary file
rm "$temp_file"
# Check if the input file exists
if [ ! -f "$output_file" ]; then
  echo "Error: input file not found" >>$log
  exit 1
fi
# Encrypt the input file with OpenSSL
if openssl enc -aes-256-cbc -salt -in "$output_file" -out "$output_file_encrypt" -pass pass:"$password"; then
  echo "File encrypted successfully" >>$log
else
  echo "Error: file encryption failed" >>$log
  exit 1
fi
# Send the email with attachment
if sendemail -f "$from_email" -t "$to_email" -u "$subject" -m "$body" -s "$smtp_server" -o tls=yes -xu "$smtp_username" -xp "$smtp_password" -a "$file_path/$filename"; then
  echo "Email sent successfully" >>$log
else
  echo "Error: email sending failed" >>$log
  exit 1
fi
