<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Students in University</h2>
        <table border ="1">
          <tr  bgcolor="#9acd32">
            <th>Name</th>
            <th>Sex</th>
            <th>Birth Date</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Course</th>
            <th>Speciality</th>
            <th>Faculty Numberex</th>
            <th>Exams</th>
            <th>Enrollment</th>
            <th>Teacher Endorsment</th>
          </tr>
          <xsl:for-each select="university/student">
            <tr>
              <td>
                <xsl:value-of select="name"/>
              </td>
              <td>
                <xsl:value-of select="sex"/>
              </td>
              <td>
                <xsl:value-of select="birthdate"/>
              </td>
              <td>
                <xsl:value-of select="phone"/>
              </td>
              <td>
                <xsl:value-of select="email"/>
              </td>
              <td>
                <xsl:value-of select="course"/>
              </td>
              <td>
                <xsl:value-of select="speciality"/>
              </td>
              <td>
                <xsl:value-of select="facultynumber"/>
              </td>
              <td>
                <xsl:for-each select="listoftakenexams">
                  <div>
                    Exam name: <xsl:value-of select="exam"/>
                  </div>
                  <div>
                    Tutor: <xsl:value-of select="tutor"/>
                  </div>
                  <div>
                    Score: <xsl:value-of select="score"/>
                  </div>
                </xsl:for-each>
              </td>
              <td>
                <div>
                  Date:  <xsl:value-of select="enrollment/date"/>
                </div>
                <div>
                  Exam Score:  <xsl:value-of select="enrollment/examscore"/>
                </div>
              </td>
              <td>
                <xsl:value-of select="teacherendorsment"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>