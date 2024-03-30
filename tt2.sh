for annotation_skew_degree in '0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1' '0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2' '0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3'
do
    python experiments.py --model=resnet18 \
        --dataset=cifar10 \
        --alg=scaffold \
        --lr=0.1 \
        --batch-size=64 \
        --epochs=5 \
        --n_parties=30 \
        --rho=0.9 \
        --comm_round=50 \
        --partition='noniid-instancedependent' \
        --annotation_skew_degree="$annotation_skew_degree" \
        --beta=10\
        --device='cuda'\
        --datadir='./data/' \
        --logdir='./logs/scaffold/' \
        --noise=0\
        --init_seed=0 \
        --dt_usage='1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1'
done