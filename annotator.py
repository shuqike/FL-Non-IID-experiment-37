import torch
import torch.nn as nn
import torch.optim as optim
from resnetcifar import ResNet18_cifar10
from utils import get_dataloader, compute_accuracy


device = 'cuda'
criterion = nn.CrossEntropyLoss().to(device)

net = ResNet18_cifar10().to(device)
train_dl, test_dl, _, _ = get_dataloader('cifar10', './data/', 64, 32)
optimizer = optim.SGD(filter(lambda p: p.requires_grad, net.parameters()), lr=0.1, momentum=0.9, weight_decay=5e-4)
scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(optimizer, T_max=int(k**(1.5))+3)
for epoch in range(20):
    for tmp in [train_dl]:
        for batch_idx, (x, target) in enumerate(tmp):
            x, target = x.to(device), target.to(device)

            optimizer.zero_grad()
            x.requires_grad = True
            target.requires_grad = False
            target = target.long()

            out = net(x)
            loss = criterion(out, target)

            loss.backward()
            optimizer.step()
    scheduler.step()

    test_acc, conf_matrix = compute_accuracy(net, test_dl, get_confusion_matrix=True, device=device)
    print(test_acc)
    torch.save(net.state_dict(), './annotators/ant'+str(20))
