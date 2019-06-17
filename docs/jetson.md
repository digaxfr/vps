# nVidia Jetson

## UART Pinout

Empty
White   --> TXD
Teal    --> RXD
Empty
Empty
Black   --> GND

Buad: 115200
Data bits: 8
Stop bits: 1
Parity: None
Flow control: None

```
sudo usermod -G dialout -a <user>
minicom -b 115200 -D /dev/ttyUSB0
```
