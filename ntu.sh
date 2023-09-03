conda activate sklgen
count=0
for f in /mnt/e/yzk/NTU/motionbert_json/test/*;
do
        name=$(basename $f)
        count=$[count+1]
        if [ ! -e "/mnt/e/yzk/NTU/skl_m/test/$name.npy" ]
        then
                vid_path='/mnt/e/yzk/NTU/motionbert_json/test/'$name/$name.mp4
                json_path='/mnt/e/yzk/NTU/motionbert_json/test/'$name/alphapose-results.json
                out_path='/mnt/e/yzk/NTU/skl_m/test/'
                echo Start processing file $name
                echo Count: $count
                echo
                python infer_wild.py --file $name --vid_path $vid_path --json_path $json_path --out_path $out_path
        else
                echo File $name already finished
        fi
done
