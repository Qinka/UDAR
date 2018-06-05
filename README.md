<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\[','\\]']]}});
</script>

# UDAR

This repo is a demo of **Ultrasound Detection And Ranging**, UDAR for short.
This demo includes a hardware design and a host software.
The hardware includes two servos, a ultrasound ranging module and FPGA IP core.
The host software will include the control program and other programs.

## Hardware

The hardware includes:

* 2-D holder
* Two servos for holder's x-axis and y-axis.
* Ultrasound ranging module(URM).
* ZigBee module(option)

The holder with two servos can change the direction of URM to $(x,y)$

