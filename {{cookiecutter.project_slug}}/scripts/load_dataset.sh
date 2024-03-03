cd workspace/input
kaggle competitions download -c {{ cookiecutter.competition_name }} 
unzip {{cookiecutter.competition_name + ".zip"}}
cd ../..