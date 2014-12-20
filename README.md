# Bibe

Bibe: Basic interactive bitmap editor

Challange: https://gist.github.com/soulnafein/8ee4e60def4e5468df2f

## Usage

For complete api doc please have a look into bibe file 

rub `bibe` to activate irb session, then

```
i 4,4 # initialize 4x4 map
=> #<PixelMap:0x007fd045043428 @width=4, @height=4, @pixels=["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"]> 

l 1, 2, "B" # set {x:1, y:2} to color "B"
=> "B"

s # print map
O,O,O,O
B,O,O,O
O,O,O,O
O,O,O,O
 => nil
 
c # clear map to "O" (WHITE)
=> ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"] 

h 2, 1, 3, "L" # drawl horizontal line
 => nil

s # print map
O,O,O,O
L,L,L,O
O,O,O,O
O,O,O,O 

x # destroy map

exit
```

## Testing


```
bundle install
bundle exec ruby pixel_map_test.rb
```