for annotation_skew_degree in '1 1 1 1 1' '2 2 2 2 2' '3 3 3 3 3' '4 4 4 4 4' '5 5 5 5 5' '6 6 6 6 6' '9 9 9 9 9' '15 15 15 15 15' '20 20 20 20 20' '40 40 40 40 40'
do
    python experiments.py --model=resnet18 \
        --dataset=cifar10 \
        --alg=fedavg \
        --lr=0.1 \
        --batch-size=64 \
        --epochs=5 \
        --n_parties=5 \
        --rho=0.9 \
        --comm_round=50 \
        --partition='noniid-instancedependent' \
        --annotation_skew_degree="$annotation_skew_degree" \
        --beta=0.5\
        --device='cuda'\
        --datadir='./data/' \
        --logdir='./logs/' \
        --noise=0\
        --init_seed=0 \
        --dt_usage='1 1 1 1 1'
done