A paragraph that is nothing but math becomes a display block, outside the
paragraph rather than inside it.

  $ omd << "MD"
  > Before.
  > 
  > $$x^2 + \frac{1}{2}$$
  > 
  > After.
  > MD
  <p>Before.</p>
  <div class="math-display"><math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow><msup><mi>x</mi><mn>2</mn></msup><mo>+</mo><mfrac><mn>1</mn><mn>2</mn></mfrac></mrow></math></div>
  <p>After.</p>

Math inside a paragraph stays inline.

  $ omd << "MD"
  > A sentence with $$y_1$$ in it.
  > MD
  <p>A sentence with <math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>y</mi><mn>1</mn></msub></math> in it.</p>

A lone dollar is ordinary text, so prices and shell variables survive.

  $ omd << "MD"
  > It costs $5 and $10, and $HOME is a path.
  > MD
  <p>It costs $5 and $10, and $HOME is a path.</p>

An expression outside camlmath's subset stops the build rather than shipping
the source as text.

  $ omd << "MD"
  > $$\sqrt{2}$$
  > MD
  Error: Omd.Math_error(unknown_command(\sqrt at 0) in "\\sqrt{2}")
  [1]
