Footnote definitions on adjacent lines are all picked up.

  $ omd << "MD"
  > A first note[^1] and a second[^2].
  > 
  > [^1]: first note
  > [^2]: second note
  > MD
  <p>A first note<sup><a href="#fn:1" id="fnref-1">1</a></sup> and a second<sup><a href="#fn:2" id="fnref-2">2</a></sup>.</p>
  <div class="footnotes"><hr />
  <ol><li id="fn:1"><p>first note<sup><a href="#fnref-1">↩︎</a></sup></p>
  </li>
  <li id="fn:2"><p>second note<sup><a href="#fnref-2">↩︎</a></sup></p>
  </li>
  </ol>
  </div>

A definition still swallows the prose that follows it on the next line.

  $ omd << "MD"
  > A note[^a].
  > 
  > [^a]: the note
  > continued on the next line
  > MD
  <p>A note<sup><a href="#fn:a" id="fnref-a">a</a></sup>.</p>
  <div class="footnotes"><hr />
  <ol><li id="fn:a"><p>the note
  continued on the next line<sup><a href="#fnref-a">↩︎</a></sup></p>
  </li>
  </ol>
  </div>

A footnote body may contain an inline link without ending the definition.

  $ omd << "MD"
  > A note[^b].
  > 
  > [^b]: see [the page](https://example.com/) for more
  > [^c]: another note
  > 
  > And a reference to it[^c].
  > MD
  <p>A note<sup><a href="#fn:b" id="fnref-b">b</a></sup>.</p>
  <p>And a reference to it<sup><a href="#fn:c" id="fnref-c">c</a></sup>.</p>
  <div class="footnotes"><hr />
  <ol><li id="fn:b"><p>see <a href="https://example.com/">the page</a> for more<sup><a href="#fnref-b">↩︎</a></sup></p>
  </li>
  <li id="fn:c"><p>another note<sup><a href="#fnref-c">↩︎</a></sup></p>
  </li>
  </ol>
  </div>

A label referenced more than once gets one id per reference, and the backlink
returns to the first.

  $ omd << "MD"
  > Once[^a], twice[^a] and inside emphasis *a third time[^a]*.
  > 
  > [^a]: the note
  > MD
  <p>Once<sup><a href="#fn:a" id="fnref-a">a</a></sup>, twice<sup><a href="#fn:a" id="fnref-a-2">a</a></sup> and inside emphasis <em>a third time<sup><a href="#fn:a" id="fnref-a-3">a</a></sup></em>.</p>
  <div class="footnotes"><hr />
  <ol><li id="fn:a"><p>the note<sup><a href="#fnref-a">↩︎</a></sup></p>
  </li>
  </ol>
  </div>
