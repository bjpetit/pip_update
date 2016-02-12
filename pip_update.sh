#!/bin/bash
# Update version of pip and then update each package installed
# by pip
#  Note: Some packages may require python-devel/python-dev
#
# Brent Petit 2016

echo "Updating current pip version..."
pip install --upgrade pip

echo "Updating current pip packages..."
echo "Current packages==versions"
PIP_FREEZE=$(pip freeze)
echo "$PIP_FREEZE"

echo ""
echo "Starting updates..."
echo ""

for package in $(echo "$PIP_FREEZE" | grep -vE "^[\#\/]" | sed -e 's/^\([A-Za-z0-9\.\-]*\)\=\=[0-9.a-zA-Z\-\=]*/\1/p' | sort -u | xargs); do
  echo "Updating package: $package"
  echo "=========="
  pip install -U $package;
  echo "=========="
done

echo ""
echo "Updated versions"

pip freeze

echo DONE
