#! /bin/bash

MODEL_NAME="dogo"
MODEL_PARAM="dogo_param.erb"

echo "### PARAMETERS ###"
echo "model name: $MODEL_NAME"
echo ""

# Create sdf model
(cat $MODEL_PARAM && cat functions.erb && cat dogo.sdf.erb) | erb -T 1 > $MODEL_NAME.sdf #file.sdf
echo "[INFO] model.sdf file created. ($MODEL_NAME.sdf)"

