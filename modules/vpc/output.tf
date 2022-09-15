output "public-1a" {
  value = aws_subnet.public-1a.id
}
output "public-1b" {
  value = aws_subnet.public-1b.id
}
output "private-1a" {
  value = aws_subnet.private-1a.id
}
output "private-1b" {
  value = aws_subnet.privat-1b
}
output "cidr_block" {
  value = aws_vpc.main.cidr_block
}
output "vpc_id" {
  value = aws_vpc.main.id
}