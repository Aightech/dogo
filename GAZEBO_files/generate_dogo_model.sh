#! /bin/bash

MODEL_NAME="dogo"
MODEL_PARAM="dogo_param.erb"

echo "### PARAMETERS ###"
echo "model name: $MODEL_NAME"
echo ""

# Create sdf model
(cat $MODEL_PARAM && cat functions.erb && cat dogo.sdf.erb) | erb -T 1 > $MODEL_NAME.sdf #file.sdf
(cat $MODEL_PARAM && cat functions.erb && cat dogo.config.erb) | erb -T 1 > $MODEL_NAME.config #file.config
mkdir -p ~/.gazebo/models/dogo
cp $MODEL_NAME.sdf ~/.gazebo/models/dogo/$MODEL_NAME.sdf
cp $MODEL_NAME.config ~/.gazebo/models/dogo/$MODEL_NAME.config

cp ../STL_files/leg0.STL ~/.gazebo/models/dogo/full_leg0.STL
cp ../STL_files/full_leg1.STL ~/.gazebo/models/dogo/full_leg1.STL
cp ../STL_files/full_leg2.STL ~/.gazebo/models/dogo/full_leg2.STL
cp ../STL_files/full_leg3.STL ~/.gazebo/models/dogo/full_leg3.STL

echo "[INFO] model.sdf file created. ($MODEL_NAME.sdf)"

