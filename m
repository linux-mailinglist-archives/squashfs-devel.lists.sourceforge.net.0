Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6F520B00
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zT-F5; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1no4OH-00051I-MB
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 14:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ubZ2earysQ4m4NtWUTfEZKppknLOTAC4k+BzJFJ8WM=; b=jEUC0zx6sLXj6MZ77RxlvfJ2/2
 BOWbobUIIF0qm/9RQbP7uj3kgbnFEc1G+0OJrbFwJgzBMzS+kHMRNZPJGdW04B4YUr/zvhIUzCWrB
 +BAEM2vsjYwSWHhP6qBKKHUraWZAnoiVPX6k5Uq+/h+uq1Bsw+To6gUQ03BH+gc9/GNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ubZ2earysQ4m4NtWUTfEZKppknLOTAC4k+BzJFJ8WM=; b=hwfQci7cfaZXdiTl8s9ejqAxbJ
 cpv3fyLy8hEZHPZi+6mA6UbEW2udnkFnQhJX+NGCMJZD5xiQfXCJLdfKk2KSuWbqejZhuz5Np4/E3
 TdyN2ZeoOWWdTwOZ9gpG2ZtmGaLzYy3LXaBmS7/gJ6Yb9nC4+4HcptZB1ZqX3ChwhAKI=;
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1no4OF-0002JG-6J
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 14:29:35 +0000
Received: by mail-vs1-f41.google.com with SMTP id u205so14039305vsu.6
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 09 May 2022 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ubZ2earysQ4m4NtWUTfEZKppknLOTAC4k+BzJFJ8WM=;
 b=NQdpueVtViIeJL0D1z9swsFzcloyZuHOtnF7FG6mux526DHz9WXMSx853jn2nEUEtl
 Ge+E8e9KQX92pPE4torle7+rDsLkZxnlRTsrOEHP95U097nzmNByDPXr4GVvUw++e8yp
 ekElvuYrv1QCM176opoAuB3gyGm6yXFUJIVxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ubZ2earysQ4m4NtWUTfEZKppknLOTAC4k+BzJFJ8WM=;
 b=MS59Ia4zK1LA3z7dLHkVAQAr5WTZcoEnK5aNbNs8E408fPSQqPSLM2v91Le/spVB0U
 kYLNBxmVX+JU78FN5EYRzS3Q4Irue6y/SwLdycfSjqb2gWbBKiVROmg6c8+IrzX6+eln
 AZ2IYRuIKoxV441tkEIbx63H7gAu1REvs7IZblpJ/7N2xUjWep2SVXaDghyElGerHBHk
 TGl2JA2IVySw9rCHLksHbxvcA9HqJNh4mX2OK9l8cjhrf98fAJzbci60pPaRP3kPVZht
 +D3wURyeAoZLLBl3dNzahqGWcW5BN8gWU8i6aSDeJFGvX52hvKjSKO3f1GSc7Mscd+mL
 ULRQ==
X-Gm-Message-State: AOAM533GPrRUOV+W7+l0SytzhQPf73r+fpD2DSvu8RPjDhLnDUK3BRPx
 3u+34e9kwwmOGMyfluiJCbzxa8ap8L+I4cIn3l/3qA==
X-Google-Smtp-Source: ABdhPJyfzVHGS8qmhTD+a9Fv6AzA07nE/sVVpq7Wr4zE2UOc5SgzyO9l4jgcaAaAxhWTt4cA0Iajljx31sJalfmDmDk=
X-Received: by 2002:a05:6102:2372:b0:32a:4ac4:5032 with SMTP id
 o18-20020a056102237200b0032a4ac45032mr7993808vsa.69.1652106568949; Mon, 09
 May 2022 07:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
In-Reply-To: <YnkVaGB74xqWJqdG@casper.infradead.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 9 May 2022 22:29:03 +0800
Message-ID: <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 9,
 2022 at 9:21 PM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
 > > Hi Hsin-Yi and Matthew, > > > > With the patch from th [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.41 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.41 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1no4OF-0002JG-6J
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 9, 2022 at 9:21 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
> > Hi Hsin-Yi and Matthew,
> >
> > With the patch from the attachment on linux 5.10, ran the command as I
> > mentioned earlier,
> > got the results below:
> > 1:40.65 (1m + 40.65s)
> > 1:10.12
> > 1:11.10
> > 1:11.47
> > 1:11.59
> > 1:11.94
> > 1:11.86
> > 1:12.04
> > 1:12.21
> > 1:12.06
> >
> > The performance has improved obviously, but compared to linux 4.18, the
> > performance is not so good.
> >
I think you shouldn't compare the performance with 4.18 directly,
since there might be other factors that impact the performance. I'd
suggest comparing the same kernel version with:
a) with this patch
b) with c1f6925e1091 ("mm: put readahead pages in cache earlier") reverted.

According to https://lore.kernel.org/linux-mm/Ynfzh2ifG85MZEoN@casper.infradead.org/t/
It seems to be a 3 sec difference?

1:37.16 (1m + 37.16s)
1:04.18
1:05.28
1:06.07
1:06.31
1:06.58
1:06.80
1:06.79
1:06.95
1:06.61

> > Moreover, I wanted to test on linux 5.18. But I think I should revert
> > 9eec1d897139 ("squashfs: provide backing_dev_info in order to disable
> > read-ahead"),
> > right?  Otherwise, the patch doesn't work?
>
> I've never seen patch 9eec1d897139 before.  If you're going to point
> out bugs in my code, at least have the decency to cc me on it.  It
> should never have gone in, and should be reverted so the problem can
> be fixed properly.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
