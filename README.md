<p align="center" >
	<img src="/Images/logo_2048_2048.png" alt="Reportage" title="Reportage" width="300px" height="300px">
</p>

<p align="center">
	<a href="https://swift.org">
		<img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/v/Reportage.svg">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/dt/Reportage.svg">
	</a>
	<a href="https://tldrlegal.com/license/mit-license">
		<img src="https://img.shields.io/badge/License-Apache 2.0-blue.svg?style=flat">
	</a>
</p>

## At a Glance

`Reportage` is a powerful tool that simplifies console output in Xcode.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Reportage` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### Settings

Everything starts with `Logger` instance. Usually, it's enough to use the singletone (`Logger.shared`), but you can create another one with `Logger()`.

`Logger` is a highly customizable thing. You can setup width of line, offset, prefix and many other things.

<table>
  <tr>
    <th>Setting</th>
    <th>Possible values</th>
    <th>Default value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>width</code></td>
    <td>Any <code>Int</code> value bigger than <code>0</code>.</td>
    <td><code>40</code></td>
    <td>Maximum width of line. Measured in symbols.</td>
  </tr>
  <tr>
    <td><code>offset</code></td>
    <td>Any <code>Int</code> value equal to or bigger than <code>0</code>.</td>
    <td><code>0</code></td>
    <td>Left offset of logger's output. Measured in symbols.</td>
  </tr>
  <tr>
    <td><code>offsetPattern</code></td>
    <td>Any <code>String</code> value.</td>
    <td>Space.</td>
    <td>Pattern to fill the offset's space with.</td>
  </tr>
  <tr>
    <td><code>dateFormat</code></td>
    <td>
      <code>.date</code><br>
      <code>.time</code><br>
      <code>.dateTime</code><br>
      <code>.custom(value: String)</code><br>
      <code>.none</code><br>
    </td>
    <td><code>.dateTime</code></td>
    <td>Format of date printed before the message. If <code>.none</code>, date will not be printed.</td>
  </tr>
  <tr>
    <td><code>prefix</code></td>
    <td>Any <code>String</code> value.</td>
    <td>Empty.</td>
    <td>Prefix of the message. Usually emoji but can be anything else.</td>
  </tr>
  <tr>
    <td><code>uppercased</code></td>
    <td>
      <code>true</code><br>
      <code>false</code>
    </td>
    <td><code>false</code></td>
    <td>Specifies whether message should be uppercased or not.</td>
  </tr>
  <tr>
    <td><code>header</code></td>
    <td>
      <code>.emptyLine</code><br>
      <code>.line(pattern: String)</code><br>
      <code>.custom(text: String)</code><br>
      <code>.none</code>
    </td>
    <td><code>.none</code></td>
    <td>Header that is printed before the message.</td>
  </tr>
  <tr>
    <td><code>footer</code></td>
    <td>
      <code>.emptyLine</code><br>
      <code>.line(pattern: String)</code><br>
      <code>.custom(text: String)</code><br>
      <code>.none</code>
    </td>
    <td><code>.emptyLine</code></td>
    <td>Footer that is printed after the message.</td>
  </tr>
</table>

Example of `Logger`'s full customization:

```swift
Logger.shared
    .width(80)
    .offset(4)
    .offsetPattern(" ")
    .prefix("🚀")
    .dateFormat(.dateTime)
    .uppercased(false)
    .header(.none)
    .footer(.emptyLine)
```

### Output

Sending message to console is incredibly easy:

```swift
logger.print("Some message")
```

Also, you can change output settings on the go:

```swift
logger
    .dateFormat(.none)
    .offset(0)
    .prefix("🚀")
    .print("App is launched")
    .dateFormat(.time)
    .offset(20)
    .prefix("🖥")
    .print("Authorization requested")
```

## License

`Reportage` is available under the Apache 2.0 license. See the [LICENSE](./LICENSE) file for more info.
