resource "aws_instance" "test_instance" {
    ami = "ami-02241e4f36e06d650"  # eu-central-1 region ami
    instance_type = "t2.micro"
}