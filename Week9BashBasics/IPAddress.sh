#!/bin/bash

skibidi=$(ip addr | grep "inet 10.0" | awk '{print $2}' | cut -d'/' -f1)

echo $skibidi 
