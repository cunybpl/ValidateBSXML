require_relative './validateBSXML_cunybpl.rb'

print "For validating single file:\ntype 's'\nFor validating multiple files:\ntype 'm'\n\n"
mode = gets.strip

bsxmls =[]
case mode
when 's'
    print "Enter full path to xml with filename ending in '.xml':\n\n"
    bsxmls = [gets.strip]
when 'm'
    print "Enter full path to folder containing BSXMLs you intend to validate:\n\n"
    bsxmlFolder = gets.strip
    bsxmls = Dir.glob(["#{bsxmlFolder}/*.xml"])
    bsxmls.each {|bsxml| bsxml = bsxmlFolder+"/"+bsxml}
end

print "Enter the version of files you'll validate (e.g. 2.2.0):\n\n"
vers = gets.strip

BuildingSync::SelectionTool.new(bsxmls,vers)