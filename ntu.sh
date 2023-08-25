conda activate sklgen
count=0
for f in /mnt/h/Datasets/NTU/motionbert_json/test/*;
do
        name=$(basename $f)
        count=$[count+1]
        vid_path='/mnt/h/Datasets/NTU/motionbert_json/test/'$name/$name.mp4
        json_path='/mnt/h/Datasets/NTU/motionbert_json/test/'$name/alphapose-results.json
        out_path='/mnt/h/Datasets/NTU/motionbert_json/test/'$name/
        echo Start processing file $name
        echo Count: $count
        echo
        python infer_wild.py --vid_path $vid_path --json_path $json_path --out_path $out_path
done
