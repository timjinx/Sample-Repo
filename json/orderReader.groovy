import groovy.json.*
import groovy.util.*
import groovy.xml.*
import java.util.*
import static groovy.io.FileType.FILES
java.lang.Object.getClass()

String fileContents = new File('order2.json').text
def slurper = new groovy.json.JsonSlurper()
def result = slurper.parseText(fileContents)
def tabletotal = [:]
def total = 0

for (order in result) {
	total += order.total
	try {
		tabletotal[order.table] = tabletotal[order.table] + order.total
	}
	catch(Exception ex) {
		tabletotal[order.table] = order.total
	}
}
for (t in tabletotal) {
	printf("Table %s had a total of \u0024%.2f\n",t.getKey(), t.getValue())
}
printf("The grand total is \u0024%.2f\n",total)
