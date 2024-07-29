resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private"
  }
}


resource "aws_route_table_association" "rta-private-1" {
  subnet_id      = aws_subnet.sb-private-1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "rta-private-2" {
  subnet_id      = aws_subnet.sb-private-2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "rta-private-3" {
  subnet_id      = aws_subnet.sb-private-3.id
  route_table_id = aws_route_table.private.id
}